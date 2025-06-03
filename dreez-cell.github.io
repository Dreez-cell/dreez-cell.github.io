<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="google-adsense-account" content="ca-pub-6967873714106764">

  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6967873714106764"
     crossorigin="anonymous"></script>

  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Testagram</title>

  <!-- ExoClick Scripts -->
  <script async src="https://a.magsrv.com/ad-provider.js"></script>
  <script async src="https://a.pemsrv.com/ad-provider.js"></script>

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
        Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
      background-color: #000;
      color: #fff;
    }

    .container {
      width: 100%;
      min-height: 100vh;
      background-color: #000;
      display: flex;
      flex-direction: column;
    }

    header {
      height: 56px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      font-weight: bold;
      border-bottom: 1px solid #2a2a2a;
      background-color: #000;
      position: sticky;
      top: 0;
      z-index: 10;
    }

    main {
      flex: 1;
      padding: 8px 0;
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    .thread-box, .ad-box {
      background-color: #1a1a1a;
      border-radius: 0;
      padding: 12px;
      border-bottom: 1px solid #333;
      width: 100%;
    }

    iframe {
      width: 100%;
      height: 500px;
      border: none;
    }

    .ad-box iframe, .ad-box ins {
      display: block;
      margin: 0 auto;
      max-width: 100%;
    }

    #disqus_thread, #disqus_recommendations {
      padding-top: 8px;
    }

    a {
      color: #fff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
  <div class="container">
    <header>Testagram</header>
    <main>
      <div class="ad-box">
        <div id="hp-ad-top"></div>
        <script type="text/javascript">
          atOptions = {
            'key': '18d0d482298d34bd3713b4a42c4121c6',
            'format': 'iframe',
            'height': 250,
            'width': 300,
            'params': {}
          };
        </script>
        <script type="text/javascript" src="//www.highperformanceformat.com/18d0d482298d34bd3713b4a42c4121c6/invoke.js"></script>
      </div>

      <div class="ad-box">
        <ins class="eas6a97888e37" data-zoneid="5207058" style="display:block;width:100%;max-width:300px;"></ins>
        <script>
          (AdProvider = window.AdProvider || []).push({ "serve": {} });
        </script>
      </div>

      <div class="thread-box">
        <iframe src="https://dreez-cell.github.io/Trends/"></iframe>
      </div>

      <div class="ad-box">
        <ins class="eas6a97888e33" data-zoneid="5124374" style="display:block;width:100%;max-width:300px;"></ins>
        <script>
          (AdProvider = window.AdProvider || []).push({ "serve": {} });
        </script>
      </div>

      <div class="thread-box">
        <div id="disqus_thread"></div>
      </div>

      <div class="thread-box">
        <div id="disqus_recommendations"></div>
      </div>
    </main>
  </div>

  <script>
    var disqus_config = function () {
      this.page.url = window.location.href;
      this.page.identifier = window.location.pathname;
      this.theme = 'dark';
    };
    (function () {
      var d = document, s = d.createElement('script');
      s.src = 'https://celebrity-gossip-3.disqus.com/embed.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
    })();
  </script>

  <script>
    (function () {
      var d = document, s = d.createElement('script');
      s.src = 'https://celebrity-gossip-3.disqus.com/recommendations.js';
      s.setAttribute('data-timestamp', +new Date());
      (d.head || d.body).appendChild(s);
    })();
  </script>

  <noscript>
    Please enable JavaScript to view the
    <a href="https://celebrity-gossip-3.disqus.com/embed.js" rel="nofollow">comments powered by Disqus.</a>
  </noscript>
</body>
</html>
