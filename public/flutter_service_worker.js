'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "195df9082e4685b9036e9679f6ccaaea",
"index.html": "06c4c98ade9ace182e7d9e47249e0545",
"/": "06c4c98ade9ace182e7d9e47249e0545",
"main.dart.js": "52b5267f6a080515ff5706da7ce7dbb8",
"favicon.png": "04b72ed92047c64295d05d107114f46a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/favicon.png": "04b72ed92047c64295d05d107114f46a",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e4a95f596ea088904de7281fa1cc070a",
"assets/stickers/1625471355257.png": "d252374b37e5a5f889e6dccf3d182248",
"assets/stickers/404Error.png": "373ac592c58a8dd9829dd4a67b1f00e8",
"assets/images/medium_yellow_jordy.png": "7c14ce62cb85cc9ad7bd830631a400d8",
"assets/images/big_yellow.png": "02a82809afe8b7ed59f611766c1f2a8b",
"assets/images/jordy_purple.jpg": "ece1dab684e67e527ccba3e611342654",
"assets/images/swiftui_macbook.png": "a151730046f7ac186031a760fe890b92",
"assets/AssetManifest.json": "1b03c0594eb79341079657095c57e28e",
"assets/png/pngegg-3.png": "a2292b8c9422d5be494e950cd0bb10c7",
"assets/png/png_thumb.png": "4584a7bf420e612ffd3fdfd65dc457ab",
"assets/png/pngegg-2.png": "a00831a712bb4f59eba35cb2c4c7a737",
"assets/png/pngegg-0.png": "b4dd4c5e18b3c0a0c35018f37c2b2f94",
"assets/png/pngegg-1.png": "28554d154d62417398fdc9b062464263",
"assets/png/timesup.png": "f55ae142f7933434c76411062f266780",
"assets/png/pngegg-5.png": "c2d6e9861f5bb81ecd0231e80adbfbe3",
"assets/png/pngegg-4.png": "a2f77e50781ad9336f3f4c702daa0932",
"assets/png/pngegg-6.png": "0261db2fe867bd10fa2491abb95bbae0",
"assets/png/pngegg-7.png": "9228f542564a699b423ed11b590a6254",
"assets/png/hand.png": "a799e1297e92d21458ca19b335a3df7c",
"assets/png/favicon.png": "04b72ed92047c64295d05d107114f46a",
"assets/png/pngegg-9.png": "91bfbca5fd405e07db97ec9e7aa66f6b",
"assets/png/pngegg-8.png": "8f14a5693b410eb950f43128fcaf752d",
"assets/png/linkedin.png": "5066c0fee37c4432f8c9ddcc2b54d7e2",
"assets/png/business.png": "95b1694654cd115d598daa1f5d90c3cf",
"assets/png/cmd.png": "4a00bf539828b8ff15a82d44d5359153",
"assets/png/ios.png": "0ee748963738ae4f7cc4b75ea974f260",
"assets/png/pngegg-11.png": "6f3ff569994ba4bfcb8bda346771210c",
"assets/png/collection.png": "024a987b69f816f2ed02ccf2affad45b",
"assets/png/pngegg-10.png": "37fe8322b169ddbdeabf75930e886ac6",
"assets/png/pngegg-13.png": "1d45b6cee96ec31748de8c1c63987108",
"assets/NOTICES": "6d9bc32a744ed17c6f56b0f81aab4e16",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/documents/jordy_hershel.pdf": "defb372a50defa14b0f560037ba377c9",
"assets/documents/Portfolio_Jordy_Hershel.pdf": "1a0f5f054e464480edf3e143a2ddf5b7",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/stickers/1625471355257.png": "d252374b37e5a5f889e6dccf3d182248",
"assets/assets/stickers/404Error.png": "373ac592c58a8dd9829dd4a67b1f00e8",
"assets/assets/images/medium_yellow_jordy.png": "7c14ce62cb85cc9ad7bd830631a400d8",
"assets/assets/images/big_yellow.png": "02a82809afe8b7ed59f611766c1f2a8b",
"assets/assets/images/jordy_purple.jpg": "ece1dab684e67e527ccba3e611342654",
"assets/assets/images/swiftui_macbook.png": "a151730046f7ac186031a760fe890b92",
"assets/assets/png/pngegg-3.png": "a2292b8c9422d5be494e950cd0bb10c7",
"assets/assets/png/png_thumb.png": "4584a7bf420e612ffd3fdfd65dc457ab",
"assets/assets/png/pngegg-2.png": "a00831a712bb4f59eba35cb2c4c7a737",
"assets/assets/png/pngegg-0.png": "b4dd4c5e18b3c0a0c35018f37c2b2f94",
"assets/assets/png/pngegg-1.png": "28554d154d62417398fdc9b062464263",
"assets/assets/png/timesup.png": "f55ae142f7933434c76411062f266780",
"assets/assets/png/pngegg-5.png": "c2d6e9861f5bb81ecd0231e80adbfbe3",
"assets/assets/png/pngegg-4.png": "a2f77e50781ad9336f3f4c702daa0932",
"assets/assets/png/pngegg-6.png": "0261db2fe867bd10fa2491abb95bbae0",
"assets/assets/png/pngegg-7.png": "9228f542564a699b423ed11b590a6254",
"assets/assets/png/hand.png": "a799e1297e92d21458ca19b335a3df7c",
"assets/assets/png/favicon.png": "04b72ed92047c64295d05d107114f46a",
"assets/assets/png/pngegg-9.png": "91bfbca5fd405e07db97ec9e7aa66f6b",
"assets/assets/png/pngegg-8.png": "8f14a5693b410eb950f43128fcaf752d",
"assets/assets/png/linkedin.png": "5066c0fee37c4432f8c9ddcc2b54d7e2",
"assets/assets/png/business.png": "95b1694654cd115d598daa1f5d90c3cf",
"assets/assets/png/cmd.png": "4a00bf539828b8ff15a82d44d5359153",
"assets/assets/png/ios.png": "0ee748963738ae4f7cc4b75ea974f260",
"assets/assets/png/pngegg-11.png": "6f3ff569994ba4bfcb8bda346771210c",
"assets/assets/png/collection.png": "024a987b69f816f2ed02ccf2affad45b",
"assets/assets/png/pngegg-10.png": "37fe8322b169ddbdeabf75930e886ac6",
"assets/assets/png/pngegg-13.png": "1d45b6cee96ec31748de8c1c63987108",
"assets/assets/documents/jordy_hershel.pdf": "defb372a50defa14b0f560037ba377c9",
"assets/assets/documents/Portfolio_Jordy_Hershel.pdf": "1a0f5f054e464480edf3e143a2ddf5b7"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
