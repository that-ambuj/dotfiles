;; extends

; AlpineJS attributes
(attribute
  (attribute_name) @_attr
    (#lua-match? @_attr "^x%-%l")
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#set! injection.language "javascript"))

((script_element
  (raw_text) @injection.content)
  (#set! injection.language "javascript"))

((style_element
  (raw_text) @injection.content)
  (#set! injection.language "css"))
