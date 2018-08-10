#
#  Be sure to run `pod spec lint KAppStoreFeedback.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "KAppStoreFeedback"
  s.version      = "1.0.9"
  s.summary      = "Simple way to ensure possitive feedback in AppStore"
  s.description  = "Simple (3 type) modal to collect user feedback upon subsequent visit to App. Navigate to AppStore review if positive user experience, in case of negative navigate to help center/email to support."
  s.homepage     = "https://github.com/karanayyana/KAppStoreFeedback"
  s.screenshots  = "https://github.com/karanayyana/KAppStoreFeedback/blob/master/Feedback.gif"
  s.license      = "MIT"
  s.author             = { "Prajwal Karanayyana Vasantha" => "prajwal.kv1@gmail.com" }
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/karanayyana/KAppStoreFeedback.git", :tag => "1.0.9" }

  s.source_files  = "KAppStoreFeedback/**/*.{h,swift,xib}"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

    s.resource  = "KAppStoreFeedback/**/*.{xib,xcassets}"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
