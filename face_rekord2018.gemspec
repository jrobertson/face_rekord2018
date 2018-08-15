Gem::Specification.new do |s|
  s.name = 'face_rekord2018'
  s.version = '0.1.0'
  s.summary = 'A wrapper of the Aws::Rekognition gem.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/face_rekord2018.rb']
  s.add_runtime_dependency('aws-sdk', '~> 1.4', '>=1.4.12')
  s.signing_key = '../privatekeys/face_rekord2018.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/face_rekord2018'
end
