const CACHE_NAME = 'testagram-cache-v1';
const RSS_API_URL = '/api/news'; // Your backend endpoint

const ASSETS_TO_CACHE = [
  '/',
  '/index.html',
  '/manifest.json',
  '/icons/icon-192x192.png',
  '/icons/icon-512x512.png',
  // Add your CSS, JS, fonts, etc. here
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => cache.addAll(ASSETS_TO_CACHE))
  );
  self.skipWaiting();
});

self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(
        keys.filter(key => key !== CACHE_NAME)
          .map(key => caches.delete(key))
      )
    )
  );
  self.clients.claim();
});

self.addEventListener('fetch', event => {
  const { request } = event;

  // Cache-first for assets
  if (ASSETS_TO_CACHE.includes(new URL(request.url).pathname)) {
    event.respondWith(
      caches.match(request).then(cachedResponse =>
        cachedResponse || fetch(request)
      )
    );
    return;
  }

  // Network-first for API calls
  if (request.url.includes(RSS_API_URL)) {
    event.respondWith(
      fetch(request)
        .then(networkResponse => {
          return caches.open(CACHE_NAME).then(cache => {
            cache.put(request, networkResponse.clone());
            return networkResponse;
          });
        })
        .catch(() => caches.match(request))
    );
    return;
  }

  // Default to network
  event.respondWith(fetch(request));
});
