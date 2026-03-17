# Fort Resource

Modders resource for Skyrim forts. Features two navmeshed fort interiors, and Stormclock / Thalmor banner textures to match the generic banner mesh.

## Forts

Load the `fort-resource.esp` file as a plugin file and the target project as the active file. Duplicate chosen cells and then reload the target project without the fort resource.

+ AAFRFort01
  - Navmesh: True
+ AAFRFort02
  - Navmesh: True
  - Variation Markers: AAFR02ImperialMarker, AAFR02StormcloakMarker

## Banners

Texture files need to be loaded as texture objects to apply them to banner objects in Creation Kit. The `fort-resource-banners.esp` provides a complete demo, banners can be previewed in the `AAFRBanner01` cell. The preview cell also includes the default Imperial banner that matches the generic banner size for reference.

+ Texture Objects
  - AAFRBannerStormcloak
  - AAFRBannerThalmor
+ Banner Objects
  - AAFRBannerStormcloak01, AAFRBannerStormcloak02, AAFRBannerStormcloak03, AAFRBannerStormcloak04
  - AAFRBannerThalmor01, AAFRBannerThalmor02, AAFRBannerThalmor03, AAFRBannerThalmor04
