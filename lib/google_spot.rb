module GoogleSpot

  def as_json(options={})
    j = {
      name: self.name,
      place_id: self.place_id,
      lat: self.lat,
      lng: self.lng,
      address: self.vicinity,
      photo: '',
      rating: -1,
      latest_ratings: []
    }
    # j[:photo] = self.photos[0].fetch_url(800)  if self.photos.any?
    j[:rating] = self.rating  if self.rating != nil
    return j
  end

end

# Sample raw JSON:
# {
#     "reference": "CmRSAAAAS7G2C6LyIgWnSnmPyYAzHWwoweY_9DAdvhEEst6Y17sH4NVQsQSW2ByGJFaM3kz3IOkio6YJbYyrbrPI1WsuiWdW_x-tJjALvNdfAVRvpbNk48UIdNbJawCdr2Vmx1KrEhD7366wzhcvhJivSzGALapwGhQ8hG2xAb6TlP0xKaLoU5H0_p0_Rw",
#     "place_id": "ChIJe-LrUpuQqTMR6i3tceaXyI4",
#     "vicinity": "Marigondon Marigondon Beach Road",
#     "lat": 10.2585482,
#     "lng": 123.9811635,
#     "viewport": {
#       "northeast": {
#         "lat": 10.2598971802915,
#         "lng": 123.9825124802915
#       },
#       "southwest": {
#         "lat": 10.2571992197085,
#         "lng": 123.9798145197085
#       }
#     },
#     "name": "Jakophil Restaurant",
#     "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
#     "types": [
#       "restaurant",
#       "food",
#       "point_of_interest",
#       "establishment"
#     ],
#     "id": "8a8deaeaef71bf59e8de3677da6c1a59a86fd7de",
#     "formatted_phone_number": null,
#     "international_phone_number": null,
#     "formatted_address": null,
#     "address_components": null,
#     "street_number": null,
#     "street": null,
#     "city": null,
#     "region": null,
#     "postal_code": null,
#     "country": null,
#     "rating": 1,
#     "price_level": null,
#     "opening_hours": null,
#     "url": null,
#     "cid": 0,
#     "website": null,
#     "zagat_reviewed": null,
#     "zagat_selected": null,
#     "aspects": [],
#     "review_summary": null,
#     "photos": [
#       {
#         "width": 640,
#         "height": 360,
#         "photo_reference": "CmRaAAAALc2cbSXmxk2iQAOcL_d2SNqbore1kbRf27wCrp8YJg2LcO_EPJYveToR9DZPNAZHiUU1w7GAD-MniUm5kcsUN7KCaPHMfP2VASN5GemK-IchOuFdEeGXYGLNXF0_Y0onEhDf_5g1LPIcT8Sxpjo376_cGhSLMb9qFwdxo3cTmE9CrNP46qOV9Q",
#         "html_attributions": [
#           "<a href=\"https://maps.google.com/maps/contrib/109498212915164536360/photos\">Saito JIS</a>"
#         ],
#         "api_key": "AIzaSyBqIHyjvRNvoAojiwKptuQqca-epvDrMyk"
#       }
#     ],
#     "reviews": [],
#     "nextpagetoken": null,
#     "events": [],
#     "utc_offset": null,
#     "permanently_closed": null
#   },
#   {
#     "reference": "CmRRAAAAL00zt2VYGMi1UutYWh5L0tkHoRkbYXm018Lzxl3SUYwhL9y7ohccZn6t0fLCkOljZ3bwyL3V1SrxJxyI0N4qzopOZp6Z6PFQZ2Y8q8NoqOBJQkMuMkD1wflBTfRIVCKbEhDjGIKmtHa6KCNLr5HK9DIAGhROds-NJvyHBpVC9zC3eFdGzIY7Tg",
#     "place_id": "ChIJ343GnAGaqTMRJ2_-ktmH00U",
#     "vicinity": "UGF, Gaisano Grand Mall Mactan, Basak-Marigondon Road, Lapu-Lapu City",
#     "lat": 10.2864022,
#     "lng": 123.9694422,
#     "viewport": {
#       "northeast": {
#         "lat": 10.2876703802915,
#         "lng": 123.9706047302915
#       },
#       "southwest": {
#         "lat": 10.2849724197085,
#         "lng": 123.9679067697085
#       }
#     },
#     "name": "Greenwich",
#     "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
#     "types": [
#       "restaurant",
#       "food",
#       "point_of_interest",
#       "establishment"
#     ],
#     "id": "ff0be575908525c23e7e5462f5725dc7f212b916",
#     "formatted_phone_number": null,
#     "international_phone_number": null,
#     "formatted_address": null,
#     "address_components": null,
#     "street_number": null,
#     "street": null,
#     "city": null,
#     "region": null,
#     "postal_code": null,
#     "country": null,
#     "rating": 3.8,
#     "price_level": null,
#     "opening_hours": {
#       "open_now": true,
#       "weekday_text": []
#     },
#     "url": null,
#     "cid": 0,
#     "website": null,
#     "zagat_reviewed": null,
#     "zagat_selected": null,
#     "aspects": [],
#     "review_summary": null,
#     "photos": [
#       {
#         "width": 3024,
#         "height": 4032,
#         "photo_reference": "CmRaAAAApf3AtzuMdY-q3FswcnFZMvIkIxj71lL1Z8qrzVoy3j5q2u4jLtgypQJYEzk8fg_RoGI8y6lWmJcryihGo2eTondrUMDUZ2DqM6_3Ygw2wiwZVf-Qu3E895LkgvKwYonjEhAjtIlkkPCHM7PnhgoSC48nGhS5IBcdWMV8fBjnGSjqXH_thUm4Xg",
#         "html_attributions": [
#           "<a href=\"https://maps.google.com/maps/contrib/108003204185403313886/photos\">Hiro Uyehara</a>"
#         ],
#         "api_key": "AIzaSyBqIHyjvRNvoAojiwKptuQqca-epvDrMyk"
#       }
#     ],
#     "reviews": [],
#     "nextpagetoken": null,
#     "events": [],
#     "utc_offset": null,
#     "permanently_closed": null
#   },