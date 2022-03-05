'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
    "version.json": "195df9082e4685b9036e9679f6ccaaea",
    "index.html": "b7fe041dd7f954f5328a4cf1029f98a8",
    "/": "b7fe041dd7f954f5328a4cf1029f98a8",
    "main.dart.js": "f3b4ad8cef0bbaf0a6a1f64fa64ba408",
    "favicon.png": "04b72ed92047c64295d05d107114f46a",
    "icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
    "icons/favicon.png": "04b72ed92047c64295d05d107114f46a",
    "icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
    "manifest.json": "e4a95f596ea088904de7281fa1cc070a",
    "assets/stickers/1625471355257.png": "d252374b37e5a5f889e6dccf3d182248",
    "assets/stickers/404Error.png": "373ac592c58a8dd9829dd4a67b1f00e8",
    "assets/stickers/sticker.jpg": "753b690ac0a369c29a834b8c9dcb06be",
    "assets/images/head_banner.png": "30b9dfaf625e2a63af6996c70c254a66",
    "assets/images/jordy.jpg": "509e4cf1dcdf9bd8af4e9730c5e304c1",
    "assets/images/jordy_purple.jpg": "ece1dab684e67e527ccba3e611342654",
    "assets/AssetManifest.json": "ca83914d723d7503760d0805969ead33",
    "assets/png/pngegg-3.png": "a2292b8c9422d5be494e950cd0bb10c7",
    "assets/png/pngegg-2.png": "a00831a712bb4f59eba35cb2c4c7a737",
    "assets/png/pngegg-0.png": "b4dd4c5e18b3c0a0c35018f37c2b2f94",
    "assets/png/pngegg-1.png": "28554d154d62417398fdc9b062464263",
    "assets/png/pngegg-5.png": "c2d6e9861f5bb81ecd0231e80adbfbe3",
    "assets/png/pngegg-4.png": "a2f77e50781ad9336f3f4c702daa0932",
    "assets/png/pngegg-6.png": "0261db2fe867bd10fa2491abb95bbae0",
    "assets/png/pngegg-7.png": "9228f542564a699b423ed11b590a6254",
    "assets/png/hand.png": "a799e1297e92d21458ca19b335a3df7c",
    "assets/png/pngegg-9.png": "e45ebd5258d77392cb78ceb7b3133eeb",
    "assets/png/pngegg-8.png": "8f14a5693b410eb950f43128fcaf752d",
    "assets/png/logo.png": "04b72ed92047c64295d05d107114f46a",
    "assets/png/business.png": "95b1694654cd115d598daa1f5d90c3cf",
    "assets/png/pngegg-11.png": "6f3ff569994ba4bfcb8bda346771210c",
    "assets/png/pngegg-10.png": "37fe8322b169ddbdeabf75930e886ac6",
    "assets/NOTICES": "705ae71f1b81f2679c2b763ae300c9c4",
    "assets/FontManifest.json": "e86747c21b89a5ce144cdb3bd2396d59",
    "assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
    "assets/documents/Portfolio_Jordy_Hershel.pdf": "1a0f5f054e464480edf3e143a2ddf5b7",
    "assets/fonts/Montserrat-LightItalic.ttf": "01c4560c9c15069b6700ce7ad2e49a9c",
    "assets/fonts/Montserrat-Medium.ttf": "c8b6e083af3f94009801989c3739425e",
    "assets/fonts/Montserrat-BoldItalic.ttf": "1b38414956c666bd1df78fe5b9c84756",
    "assets/fonts/Montserrat-Light.ttf": "409c7f79a42e56c785f50ed37535f0be",
    "assets/fonts/Montserrat-ThinItalic.ttf": "3c2b290f95cd5b33c3ead2911064a2ab",
    "assets/fonts/Montserrat-ExtraLight.ttf": "570a244cacd3d78b8c75ac5dd622f537",
    "assets/fonts/Montserrat-Thin.ttf": "43dd5b7a3d277362d5e801e5353e3a01",
    "assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
    "assets/fonts/Montserrat-MediumItalic.ttf": "40a74702035bf9ef19053c84ce9a58b9",
    "assets/fonts/Montserrat-BlackItalic.ttf": "d9b6ba595b059fc5d48e8f52c30f73b3",
    "assets/fonts/Montserrat-SemiBold.ttf": "c641dbee1d75892e4d88bdc31560c91b",
    "assets/fonts/Montserrat-ExtraLightItalic.ttf": "1170df5548b7e238df5fa14b6f1a753e",
    "assets/fonts/Montserrat-ExtraBold.ttf": "19ba7aa52a78c3896558ac1c0a5fb4c7",
    "assets/fonts/Montserrat-Black.ttf": "27e3649bab7c62fa21b8837c4842e40e",
    "assets/fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
    "assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
    "assets/fonts/Montserrat-Italic.ttf": "a7063e0c0f0cb546ad45e9e24b27bd3b",
    "assets/fonts/Montserrat-SemiBoldItalic.ttf": "83c1ec1f1db9a6416791f7d9d29536f2",
    "assets/fonts/Montserrat-ExtraBoldItalic.ttf": "52a50ca037f2f96fa567404dc3c5bdfb",
    "assets/assets/stickers/1625471355257.png": "d252374b37e5a5f889e6dccf3d182248",
    "assets/assets/stickers/404Error.png": "373ac592c58a8dd9829dd4a67b1f00e8",
    "assets/assets/images/head_banner.png": "30b9dfaf625e2a63af6996c70c254a66",
    "assets/assets/images/about_us.jpg": "1d8da77518246b9fc7368465a98cbe28",
    "assets/assets/images/jordy.jpg": "509e4cf1dcdf9bd8af4e9730c5e304c1",
    "assets/assets/images/jordy_purple.jpg": "ece1dab684e67e527ccba3e611342654",
    "assets/assets/images/swiftui_macbook.png": "a151730046f7ac186031a760fe890b92",
    "assets/assets/png/pngegg-3.png": "a2292b8c9422d5be494e950cd0bb10c7",
    "assets/assets/png/pngegg-2.png": "a00831a712bb4f59eba35cb2c4c7a737",
    "assets/assets/png/pngegg-0.png": "b4dd4c5e18b3c0a0c35018f37c2b2f94",
    "assets/assets/png/pngegg-1.png": "28554d154d62417398fdc9b062464263",
    "assets/assets/png/pngegg-5.png": "c2d6e9861f5bb81ecd0231e80adbfbe3",
    "assets/assets/png/pngegg-4.png": "a2f77e50781ad9336f3f4c702daa0932",
    "assets/assets/png/pngegg-6.png": "0261db2fe867bd10fa2491abb95bbae0",
    "assets/assets/png/pngegg-7.png": "9228f542564a699b423ed11b590a6254",
    "assets/assets/png/hand.png": "a799e1297e92d21458ca19b335a3df7c",
    "assets/assets/png/favicon.png": "04b72ed92047c64295d05d107114f46a",
    "assets/assets/png/pngegg-9.png": "e45ebd5258d77392cb78ceb7b3133eeb",
    "assets/assets/png/pngegg-8.png": "8f14a5693b410eb950f43128fcaf752d",
    "assets/assets/png/logo.png": "d41d8cd98f00b204e9800998ecf8427e",
    "assets/assets/png/business.png": "95b1694654cd115d598daa1f5d90c3cf",
    "assets/assets/png/pngegg-11.png": "6f3ff569994ba4bfcb8bda346771210c",
    "assets/assets/png/pngegg-10.png": "37fe8322b169ddbdeabf75930e886ac6",
    "assets/assets/png/pngegg-13.png": "1d45b6cee96ec31748de8c1c63987108",
    "assets/assets/documents/Portfolio_Jordy_Hershel.pdf": "1a0f5f054e464480edf3e143a2ddf5b7",
    "assets/assets/documents/JordyHershel_IGONDJO_Resume.PDF": "f88514c87464b5272bc109c33be168b5",
    "assets/assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
    "assets/assets/fonts/Montserrat-SemiBold.ttf": "c641dbee1d75892e4d88bdc31560c91b",
    "assets/assets/fonts/Montserrat-ExtraBold.ttf": "19ba7aa52a78c3896558ac1c0a5fb4c7",
    "assets/assets/fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
    "canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
    "canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
    "canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
    "canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
    "/",
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
self.addEventListener("activate", function (event) {
    return event.waitUntil(async function () {
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
        .then((cache) => {
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
