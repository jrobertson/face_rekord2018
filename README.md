# Introducing the face_rekord2018 gem

    require 'face_rekord2018'

    key_id, secret = 'YOUR_AWS_KEY', 'YOUR_SECRET_KEY'

    face = FaceRekord2018.new(access_key: key_id, secret_key: secret)
    face.store '/home/james/face_rekord/bob.jpg', 'Bob'
    #=> #<struct Aws::Rekognition::Types::IndexFacesResponse face_records=[], orientation_correction="ROTATE_0", face_model_version="3.0"> 

    face.store '/home/james/face_rekord/bill.jpg', 'Bill'
    #=> #<struct Aws::Rekognition::Types::IndexFacesResponse face_records=[], orientation_correction="ROTATE_0", face_model_version="3.0"> 

    face.store '/home/james/face_rekord/donald.jpg', 'Donald'
    #=> #<struct Aws::Rekognition::Types::IndexFacesResponse face_records=[#<struct Aws::Rekognition::Types::FaceRecord face=#<struct Aws::Rekognition::Types::Face face_id="99c5d2a2-630c-4278-82ce-c7e2e94b02f2", bounding_box=#<struct Aws::Rekognition::Types::BoundingBox width=0.6010928750038147, height=0.4375, left=0.21994535624980927, top=0.1994047611951828>, image_id="fcfc442a-5f73-5c4f-959c-49b977cbfd20", external_image_id="Donald", confidence=99.97306823730469>, face_detail=#<struct Aws::Rekognition::Types::FaceDetail bounding_box=#<struct Aws::Rekognition::Types::BoundingBox width=0.6010928750038147, height=0.4375, left=0.21994535624980927, top=0.1994047611951828>, age_range=nil, smile=nil, eyeglasses=nil, sunglasses=nil, gender=nil, beard=nil, mustache=nil, eyes_open=nil, mouth_open=nil, emotions=nil, landmarks=[#<struct Aws::Rekognition::Types::Landmark type="eyeLeft", x=0.4108065068721771, y=0.3584040403366089>, #<struct Aws::Rekognition::Types::Landmark type="eyeRight", x=0.6267039179801941, y=0.35479071736335754>, #<struct Aws::Rekognition::Types::Landmark type="nose", x=0.5344300866127014, y=0.46345028281211853>, #<struct Aws::Rekognition::Types::Landmark type="mouthLeft", x=0.4512757658958435, y=0.5255412459373474>, #<struct Aws::Rekognition::Types::Landmark type="mouthRight", x=0.6204619407653809, y=0.5188779234886169>], pose=#<struct Aws::Rekognition::Types::Pose roll=-1.8497415781021118, yaw=2.3652427196502686, pitch=-9.75280475616455>, quality=#<struct Aws::Rekognition::Types::ImageQuality brightness=47.18401336669922, sharpness=99.9305191040039>, confidence=99.97306823730469>>], orientation_correction=nil, face_model_version="3.0"> 

    r = face.recognise '/home/james/face_rekord/whoisthis.jpg'
    #=> {:id=>"Donald", :confidence=>99.97309875488281, :message=>"Face found!"} 

    face = FaceRekord2018.new(access_key: key_id, secret_key: secret)
    r = face.recognise '/home/james/face_rekord/whoisthis.jpg'
    #=> {:id=>"Donald", :confidence=>99.97309875488281, :message=>"Face found!"} 

    face.collections
    #=> ["default"]

The above script demonstrates using the face_rekord2018 gem (which is a wrapper of the Aws::Rekognition gem) to identify a face from a known list of faces. 


Note: The face recognition service expects a realistic image of a face. A simple drawing of a face will probably not be accepted.


## Resources

* Building a face recognition web app in under an hour https://hackernoon.com/building-a-face-recognition-web-app-in-under-an-hour-345aa91487c
* FaceRekognition-Demo/faceapp.rb at master · CyberFerret/FaceRekognition-Demo https://github.com/CyberFerret/FaceRekognition-Demo/blob/master/faceapp.rb
* face_rekord2018 https://rubygems.org/gems/face_rekord2018

gem face_rekord2018 aws face detect recognition amazon wrapper
