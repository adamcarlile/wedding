$ ->
  mapboxgl.accessToken = 'pk.eyJ1IjoiYWRhbWNhcmxpbGUiLCJhIjoiY2ozZWdldm00MDAxZjMycGp1d3QwZHFuNCJ9.pLAojhBOMHUvnqz4qxApZg'
  @self_map = new mapboxgl.Map({
    container: 'self-map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
 