{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  // Let Flutter pick the best compatible renderer for this build.
  // Forcing `html` can break on newer builds that no longer include it.
});
