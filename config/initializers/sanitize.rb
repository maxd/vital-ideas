class Sanitize
  module Config
    CURRENT = {
      :elements => [
        'a', 'b', 'blockquote', 'br', 'code', 'em', 'i', 'li', 'ol', 'p',
        'pre', 'strike', 'strong', 'u', 'ul', 'img'],

      :attributes => {
        'a'          => ['href', 'target'],
        'img'        => ['src', 'alt', 'width', 'height']
      },

      :add_attributes => {
        'a' => {'rel' => 'nofollow'}
      },

      :protocols => {
        'a'          => {'href' => ['http', 'https', 'mailto', :relative]},
        'img'        => {'src' => ['http', 'https', :relative]}
      }
    }
  end
end
