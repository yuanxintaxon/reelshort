{{flutter_js}}
{{flutter_build_config}}

window.addEventListener("load", function () {
    _flutter.loader.load({
        onEntrypointLoaded: async function (engineInitializer) {
            // Run-time engine configuration
            let config = {
                // renderer: useHtml ? "html" : "canvaskit",
                useColorEmoji: true
            };
            const appRunner = await engineInitializer.initializeEngine(config);
            await appRunner.runApp();
        },
    });
});