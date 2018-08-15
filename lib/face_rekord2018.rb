#!/usr/bin/env ruby

# file: face_rekord2018.rb


require 'aws-sdk'

# description: A wrapper of the Aws::Rekognition gem.


class FaceRekord2018
  
  attr_reader :collections


  def initialize(access_key: '', secret_key: '', region: 'us-east-1', 
                 collection: 'default', debug: false, match_threshold: 95)

    @collection, @debug, @threshold = collection, debug, match_threshold
    
    @face = Aws::Rekognition::Client.new(region: region, 
      credentials: Aws::Credentials.new(access_key, secret_key))
    
    # create the collection if it doesn't already exist
    #
    @collections = @face.list_collections({}).collection_ids

    if  !(@collections.include? collection) then
      puts 'creating a new collection' if @debug
      response = @face.create_collection({ collection_id: collection }) 
    end

  end
  
  def delete_collection(id)
    
    if (@collections.include? id)
      response = @face.delete_collection({ collection_id: id })
    else
      'unknown collection'
    end
    
  end

  def recognise(filename)

    response = @face.search_faces_by_image({
      collection_id: @collection,
      max_faces: 1,
      face_match_threshold: @threshold,
      image: {
        bytes: File.read(filename)
      }
    })
    
    if response.face_matches.count > 1
      {:message => "Too many faces found"}
    elsif response.face_matches.count == 0
      {:message => "No face detected!"}
    else
      {:id => response.face_matches[0].face.external_image_id, :confidence => response.face_matches[0].face.confidence, :message => "Face found!"}
    end
    
  end
  
  alias reconize recognise
  alias rekognize recognise
  
  def store(filename, image_id)

    response = @face.index_faces({
      collection_id: @collection,
      external_image_id: image_id,
      image: {
        bytes: File.read(filename)
      }
    })
    
  end

end
