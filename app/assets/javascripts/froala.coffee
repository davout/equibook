#= require froala_editor.min.js
#
#= require plugins/align.min.js
#= require plugins/colors.min.js
#= require plugins/emoticons.min.js
#= require plugins/entities.min.js
#= require plugins/file.min.js
#= require plugins/font_family.min.js
#= require plugins/font_size.min.js
#= require plugins/fullscreen.min.js
#= require plugins/image.min.js
#= require plugins/inline_style.min.js
#= require plugins/line_breaker.min.js
#= require plugins/link.min.js
#= require plugins/lists.min.js
#= require plugins/paragraph_format.min.js
#= require plugins/paragraph_style.min.js
#= require plugins/quote.min.js
#= require plugins/save.min.js
#= require plugins/table.min.js
#= require plugins/url.min.js
#= require plugins/video.min.js

fr_default_opts = {
  imageUploadURL:     '/images'
  imageUploadMethod:  'POST'
  imageUploadParams: {
    'authenticity_token': $('meta[name=csrf-token]').attr('content')
  }
}


# Enable Froala editor
$('textarea.text').froalaEditor(fr_default_opts)

# Hide license
$('a[href="https://froala.com/wysiwyg-editor"]').remove()

