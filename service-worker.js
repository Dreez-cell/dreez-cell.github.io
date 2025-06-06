const CACHE_NAME = 'testagram-cache-v2';
const DYNAMIC_CACHE = 'testagram-dynamic-cache-v2';
const OFFLINE_URL = '/offline.html';

// Static assets to pre-cache
const PRECACHE_ASSETS = [
  '/',
  '/index.html',
  '/manifest.json',
  '/favicon.ico',
  '/icons/icon-512.png',
  OFFLINE_URL
];

// Install event – Precache core assets
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME).then(cache => {
      return cache.addAll(PRECACHE_ASSETS);
    }).then(() => self.skipWaiting())
  );
});

// Activate event – Clean up old caches
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(keys =>
      Promise.all(
        keys.filter(key => key !== CACHE_NAME && key !== DYNAMIC_CACHE).map(key => caches.delete(key))
      )
    ).then(() => self.clients.claim())
  );
});

// Fetch event – Cache strategies
self.addEventListener('fetch', event => {
  const { request } = event;

  // Only handle GET
  if (request.method !== 'GET') return;

  const url = new URL(request.url);

  // Handle RSS feeds & AMP ads – Network first, fallback to cache
  const isDynamic = url.href.includes('/feed') || url.href.includes('cdn.ampproject.org') || url.href.includes('/ads/');

  if (isDynamic) {
    event.respondWith(
      fetch(request)
        .then(networkResponse => {
          return caches.open(DYNAMIC_CACHE).then(cache => {
            cache.put(request, networkResponse.clone());
            return networkResponse;
          });
        })
        .catch(() => caches.match(request))
    );
  } else {
    // Static content – Cache first, fallback to network
    event.respondWith(
      caches.match(request).then(cachedResponse => {
        return (
          cachedResponse ||
          fetch(request).then(networkResponse => {
            return caches.open(DYNAMIC_CACHE).then(cache => {
              cache.put(request, networkResponse.clone());
              return networkResponse;
            });
          }).catch(() => caches.match(OFFLINE_URL))
        );
      })
    );
  }
});
