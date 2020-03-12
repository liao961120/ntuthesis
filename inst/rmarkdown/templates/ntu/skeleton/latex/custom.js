<script>
// Add target_blank to external link
// See article-header.html for auto adding ID to h1,h2,h3
$(document).ready(function() {
  var links = document.getElementsByTagName('a');
  for (var i = 0; i < links.length; i++) {
    if (/^(https?:)?\/\//.test(links[i].getAttribute('href'))) {
      links[i].target = '_blank';
    }
  }
})();
</script>
