class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment,         type: String
  field :commenter,       type: String # Maybe make the person commenting the owner of the comment which is a member of the agent being commented on
  # field :last_name
end
