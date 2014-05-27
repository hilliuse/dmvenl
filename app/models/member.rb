class Member

  include Mongoid::Document
  include Mongoid::Timestamps

  # Hooks

  field :google_id,           type: String
  field :email,               type: String
  field :first_name,          type: String
  field :last_name,           type: String
  field :agent_name,          type: String

  field :verification_code,   type: String
  field :code_verified,       type: Boolean
  field :refered_by,          type: String # We could instate some kind of points system around this

  # Dates
  field :applied_on,          type: Date
  field :accepted_on,         type: Date
  field :ignoered_on,         type: Date
  field :banned_on,           type: Date

  field :level,               type: Integer
  field :ap,                  type: Integer

  field :status,              type: String
  field :admin,               type: Boolean,    default: false
  # field :mod,                 type: Boolean,    default: false # Probably not even necessary

  field :member_groups,       type: Array # L8, GB, RT

  # field :_id,                 type: String,     default: ->{ google_id }

  scope :aliased,       ->(agent_name)    { where(agent_name: agent_name) }
  scope :at_level,      ->(level)         { where(level: level) }
  scope :with_email,    ->(email)         { where(email: email) }
  scope :in_group,      ->(group)         { where(group.in => :member_groups) }

  validates :google_id, :email, :first_name, :last_name, :agent_name, :level, presence: true, uniqueness: true

  def self.method_name
  end

  # def approve
  #   save
  # end

  def check_code (code)
    self.code_verified = self.verification_code == code
    save
  end



end
