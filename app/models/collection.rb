class Collection < ActiveFedora::Base
  include Hydra::Collection
  include Hydra::Collections::BasicMetadata
end
