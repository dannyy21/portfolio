'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8e360fcff0681c79d4cd27ec03e14baf",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "833bf0c950b9603a2fdd7c31ddb71196",
"/": "833bf0c950b9603a2fdd7c31ddb71196",
"main.dart.js": "c3ce15ba5f4a8cf3594340ebcab1aa9b",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "19049ae3d02f54e108ecb7bf19ff5658",
"assets/NOTICES": "c4891fabc0f6ffd1dba767c528d6d23a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "0ff3c800786d5030348abcb0cc6f0f8c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lib/assets/flutter.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/lib/assets/telkomindonesia.png": "912170387d01aab399917665e7f0b95c",
"assets/lib/assets/diarium.png": "a66421f02a69cd55644c5023ac1d62b0",
"assets/lib/assets/diarium/8.png": "9266314cf631c9018d98226c393bb597",
"assets/lib/assets/diarium/9.png": "8d521986a7eb077bd301d5669e805ce7",
"assets/lib/assets/diarium/14.png": "5697bc5365953c4d3a9725afb7eb8133",
"assets/lib/assets/diarium/15.png": "4a2398155d8996b1c59d36ad92b1279a",
"assets/lib/assets/diarium/17.png": "58a154fb848bbfcd13b5f282cd3ade0f",
"assets/lib/assets/diarium/16.png": "b04b9a7043510e52609b27b098f93b4a",
"assets/lib/assets/diarium/1111.avif": "8d5281498f6857a3d41dfa2041fafb02",
"assets/lib/assets/diarium/12.png": "24dd9a9d10cb3b72d0ba02b6f5481754",
"assets/lib/assets/diarium/13.png": "2ccc799ff006d8d517a925f2ff07a1d1",
"assets/lib/assets/diarium/11.png": "d790978a3f113eb34d316acd58873695",
"assets/lib/assets/diarium/10.png": "7c145669b3f7fbcb979e5488f6caa4c0",
"assets/lib/assets/diarium/21.png": "ce433bc6d0f326c17337a1891223490d",
"assets/lib/assets/diarium/20.png": "360c4a0b089a93d023c2bc7b6d00685d",
"assets/lib/assets/diarium/22.png": "fe84c509e0f1e19d5d9543ab505bd69f",
"assets/lib/assets/diarium/header.png": "85a6691f0c240622db0a3a83db117c58",
"assets/lib/assets/diarium/23.png": "a400fbbf95a7cdb2d995edb60814c5d1",
"assets/lib/assets/diarium/27.png": "3f1692bdb51e7a36dfbd350a94dc4d46",
"assets/lib/assets/diarium/26.png": "abbe66016334ae376959d9aa8df106d5",
"assets/lib/assets/diarium/18.png": "fecd3f69c841ef0296cdc80e82f9f29d",
"assets/lib/assets/diarium/24.png": "37d3877df23852812a003531a01cccac",
"assets/lib/assets/diarium/25.png": "0ab9fe273362580b77aa20fd93534c5d",
"assets/lib/assets/diarium/19.png": "58bea8c400a5651adbb3c35fbfaa24a5",
"assets/lib/assets/diarium/4.png": "b8f63d302729ed0b20439367d5e1004c",
"assets/lib/assets/diarium/5.png": "97f1bf872bef5d5500046e3124e70216",
"assets/lib/assets/diarium/7.png": "081dfea805c0bfa03634523d48901e58",
"assets/lib/assets/diarium/6.png": "f8ae80a9b251c288419b1f1e6dc17970",
"assets/lib/assets/diarium/3.png": "f8a1fb187b5c0f1fe2355dffdc79d84e",
"assets/lib/assets/diarium/1.jpg": "b102cd845283881029983b7aae44f478",
"assets/lib/assets/eventeer/1.jpeg": "3b95b02f64b0f0749b966d922b6eb26b",
"assets/lib/assets/eventeer/6.jpeg": "574169930b19d7adc970f5ba8f5bb04d",
"assets/lib/assets/eventeer/eventheader.jpg": "6bb8095e580a6b6f1b16026d0cec6b55",
"assets/lib/assets/eventeer/4.jpeg": "0a695628f6c8a5868f825a2cd84e36d4",
"assets/lib/assets/eventeer/5.jpeg": "f4f0b38f87c23d3b27b5334966462960",
"assets/lib/assets/eventeer/2.png": "30071e815f98b0e547fd71b57c03ec40",
"assets/lib/assets/eventeer/3.png": "dd333cbe3c44eef6cdf6b10a48b41de2",
"assets/lib/assets/placeholder.png": "fb6b9912b7c241f7302693e73ed0be65",
"assets/lib/assets/headerph.png": "4bb5411188ac4ef36aede9e3de48c72e",
"assets/lib/assets/photo.png": "ad92a472f6acbbd807b175c1563c82d7",
"assets/lib/assets/telkomindonesia1.png": "e388ef379279a58c2fbe444c0b3c087a",
"assets/lib/assets/foto.png": "d56fb77032748e8af2773f27dd153526",
"assets/lib/assets/swift.jpg": "23dc0fa802f51c628bc4f3d16607c615",
"assets/lib/assets/react.png": "1061645c40a01c07144a94873c2e4965",
"assets/lib/assets/peoplehub.png": "18300783be3dd78cfc5da9a44893f233",
"assets/lib/assets/eventeer.png": "25facb8d436915e2c523c57789f81b6a",
"assets/lib/assets/flutterflow.jpg": "01db2631bb67c83cc99900c210675b98",
"assets/lib/assets/swalogo.png": "cae6fb7b9c9784fce11eff9eb021aa77",
"assets/lib/assets/kotlin.png": "3f3182e761cf45dcd05a2e745f917ce4",
"assets/AssetManifest.bin": "9a73adcc5222089b2992b0ce7178fc7c",
"assets/fonts/MaterialIcons-Regular.otf": "8680f704b52e37128693ab4f47de0cb8",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
