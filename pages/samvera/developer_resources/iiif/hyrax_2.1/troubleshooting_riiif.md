---
title: "Troubleshooting RIIIF"
permalink: troubleshooting_riiif.html
keywords: ["IIIF", "RIIIF", "Troubleshooting"]
last_updated:
version:
  label: 'Hyrax v2.1.0 (also applies to Hyrax v2.0.x)'
sidebar: home_sidebar
---

# Troubleshooting RIIIF

[RIIIF](https://github.com/curationexperts/riiif) is a gem for installing a simple [IIIF](http://iiif.io/) server into your rails application. Hyrax 2.1 ships with it, but it can be used in any rails application. This guide is for troubleshooting your installation if it isn't working as expected.

This guide assumes you have installed RIIIF either using the instructions in [the RIIIF README](https://github.com/curationexperts/riiif/blob/master/README.md), or in the Hyrax installation instructions.

## 1. Ensure the RIIIF info service is running

In your application somewhere you should have a block like the one below. In Hyrax 2.1+, it will be in `config/initializers/hyrax.rb`

```ruby
# Returns a URL that resolves to an info.json file provided by a IIIF image server
config.iiif_info_url_builder = lambda do |file_id, base_url|
  uri = Riiif::Engine.routes.url_helpers.info_url(file_id, host: base_url)
  uri.sub(%r{/info\.json\Z}, '')
end
```

Open your console and make sure that `iiif_info_url_builder` is returning something expected for a given `FileSet`. For example:

```ruby
2.4.2 :014 > fs = FileSet.find("cz30ps64c")
 => #<FileSet id: "cz30ps64c", head: [], tail: [], depositor: "bess@curationexperts.com", title: ["12219615_10153532796406998_4944957625326024288_n.jpg"], date_uploaded: "2018-05-06 14:32:42", date_modified: "2018-05-06 14:32:42", label: "12219615_10153532796406998_4944957625326024288_n.j...", relative_path: nil, import_url: nil, resource_type: [], creator: ["bess@curationexperts.com"], contributor: [], description: [], keyword: [], license: [], rights_statement: [], publisher: [], date_created: [], subject: [], language: [], identifier: [], based_near: [], related_url: [], bibliographic_citation: [], source: [], access_control_id: "c4cc4449-a032-4acf-b3b7-3b50a854f90e", embargo_id: nil, lease_id: nil>
2.4.2 :015 > Riiif::Engine.routes.url_helpers.info_url(fs.files.first.id, host: "http://localhost:3000")
 => "http://localhost:3000/images/cz30ps64c%2Ffiles%2F2ae0fa37-9052-460c-a56b-ab4603403f11/info.json"
```

Now you have a URL that should work to retrieve a IIIF image information document. Put it into a browser and see what that URL returns. It should give you something that looks like this:

```json
{
  "width": 960,
  "height": 720,
  "@context": "http://iiif.io/api/image/2/context.json",
  "@id": "http://localhost:3000/images/cz30ps64c%2Ffiles%2F2ae0fa37-9052-460c-a56b-ab4603403f11",
  "protocol": "http://iiif.io/api/image",
  "profile": ["http://iiif.io/api/image/2/level1.json", {
    "formats": ["jpg", "png"]
  }]
}
```

If you do not see a json object like the one above, or if it is missing pieces, here are some things to check:

1. Have you run `CharacterizeJob` on the `FileSet` in question? You can run it manually on the console to see if that fixes your problem:

  ```ruby
  2.4.2 :009 > CharacterizeJob.perform_now(fs, fs.files.first.id)
  ```

2. What is returned by solr for that FileSet object? You should expect to see fields like `file_format_tesim` and `height_is` if `CharacterizeJob` is running as expected.

  ```ruby
  2.4.2 :016 > fs.to_solr
   => {"system_create_dtsi"=>"2018-05-06T14:32:38Z", "system_modified_dtsi"=>"2018-05-06T14:32:46Z", "has_model_ssim"=>["FileSet"], :id=>"cz30ps64c", "accessControl_ssim"=>["c4cc4449-a032-4acf-b3b7-3b50a854f90e"], "depositor_ssim"=>["bess@curationexperts.com"], "depositor_tesim"=>["bess@curationexperts.com"], "title_tesim"=>["12219615_10153532796406998_4944957625326024288_n.jpg"], "title_sim"=>["12219615_10153532796406998_4944957625326024288_n.jpg"], "date_uploaded_dtsi"=>"2018-05-06T14:32:42Z", "date_modified_dtsi"=>"2018-05-06T14:32:42Z", "creator_tesim"=>["bess@curationexperts.com"], "creator_sim"=>["bess@curationexperts.com"], "thumbnail_path_ss"=>"/downloads/cz30ps64c?file=thumbnail", "hasRelatedMediaFragment_ssim"=>"cz30ps64c", "hasRelatedImage_ssim"=>"cz30ps64c", "label_tesim"=>"12219615_10153532796406998_4944957625326024288_n.jpg", "label_ssi"=>"12219615_10153532796406998_4944957625326024288_n.jpg", "file_format_tesim"=>"jpeg (JPEG image data, progressive, precision 8, 960x720, frames 3, JPEG File Interchange Format)", "file_format_sim"=>"jpeg (JPEG image data, progressive, precision 8, 960x720, frames 3, JPEG File Interchange Format)", "file_size_lts"=>"68370", "height_is"=>720, "width_is"=>960, "visibility_ssi"=>"open", "mime_type_ssi"=>"image/jpeg", "digest_ssim"=>"urn:sha1:2f52ac5cf3a3a7475479ea2216b0c4912aed1523", "page_count_tesim"=>[], "file_title_tesim"=>[], "duration_tesim"=>[], "sample_rate_tesim"=>[], "original_checksum_tesim"=>["70306077e1bb3afff3b0358ae1f6f6cd"], "read_access_group_ssim"=>["public"], "edit_access_group_ssim"=>["admin"], "edit_access_person_ssim"=>["bess@curationexperts.com"], "human_readable_type_sim"=>"File", "human_readable_type_tesim"=>"File"}
   2.4.2 :017 > fs.to_solr["height_is"]
 => 720
  ```

3. Are your slashes being encoded / decoded properly? Notice that the url contains a string like `FILESET_ID/files/FILE_ID`. In the url, these are encoded as `%2F`. In some environments (commonly, Apache + Passenger) these slashes do not get decoded correctly. See [the RIIIF Readme section called "Special note for Passenger and Apache users"](https://github.com/curationexperts/riiif#special-note-for-passenger-and-apache-users) for more information about addressing this problem.

## 2. Ensure the riiif image service is working
Once you are sure that the RIIIF info service is returning information as expected, make sure the graphics transformation in your environment is working.

1. Log in as the user who is running your webserver and ensure it can find and run `convert` and `identify`. You can customize the commands that are used if needed. See [the RIIIF README](https://github.com/curationexperts/riiif#graphicsmagick) for more details.

2. See what url `iiif_image_url_builder` is returning. In your rails console (note the comma after the 100):

  ```ruby
  2.4.2 :018 > Riiif::Engine.routes.url_helpers.image_url(fs.files.first.id, host: "http://localhost:3000", size: "100,")
   => "http://localhost:3000/images/cz30ps64c%2Ffiles%2F2ae0fa37-9052-460c-a56b-ab4603403f11/full/100,/0/default.jpg"
  ```
  Then, see if that URL returns an image to you in the browser.

3. If your image url isn't returning an image, check your log files. You should see something like:

  ```
  Riiif resolved cz30ps64c/files/2ae0fa37-9052-460c-a56b-ab4603403f11 to http://127.0.0.1:8984/rest/dev/cz/30/ps/64/cz30ps64c/files/2ae0fa37-9052-460c-a56b-ab4603403f11
  ```

  See whether that Fedora URL resolves... Can RIIIF actually retrieve the URL from Fedora?

## 3. Other issues

### Universal Viewer does not show new file version
See https://github.com/curationexperts/nurax/issues/253

### Universal Viewer does not display on Production server, but it displays in local development
If '/universalviewer/dist/uv-2.0.1/lib/embed.js' is returning a 404  when you inspect a work type in production that displays correctly in your local dev environment you may need to modify the following key in `config/environments/production.rb`

```ruby
config.public_file_server.enabled = true
```
 See https://github.com/pulibrary/pul_uv_rails/issues/8 and https://github.com/samvera/hyrax/wiki/Hyrax-Management-Guide#image-server
