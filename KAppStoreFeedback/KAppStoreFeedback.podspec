Pod::Spec.new do |s|
  s.name         = "KAppStoreFeedback"
  s.version      = "2.0"
  s.summary      = "Simple way to ensure possitive feedback in AppStore"
  s.description  = "Simple (3 type) modal to collect user feedback upon subsequent visit to App. Navigate to AppStore review if positive user experience, in case of negative navigate to help center/email to support."
  s.homepage     = "https://github.com/karanayyana/KAppStoreFeedback"
  s.license      = "MIT"
  s.author       = { "Prajwal Karanayyana Vasantha" => "prajwal.kv1@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/karanayyana/KAppStoreFeedback.git", :tag => s.version }
  s.source_files  = "KAppStoreFeedback/**/*.{h,swift,xib}"
  s.resource  = "KAppStoreFeedback/**/*.{xib,xcassets}"
end
