class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_initialize :set_default, if: :new_record?
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :passports, dependent: :destroy
  has_many :schedules, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable  #, :validatable

  scope :without_soft_deleted, -> { where(deleted_at: nil) }

  validates :age, presence: true
  validates :sex, presence: true
  validates_uniqueness_of :email, scope: :deleted_at
  validates_format_of :email, with: Devise.email_regexp, if: :will_save_change_to_email?
  validates :password, presence: true, confirmation: true, length: { in: Devise.password_length }, on: :create
  validates :password, confirmation: true, length: { in: Devise.password_length }, allow_blank: true, on: :update
  validates :name, presence: true, length: {maximum: 30}, uniqueness: true
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }, if: :password_presence?

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_deleted.where(conditions.to_h).first
  end

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ユーザーのアカウントが有効であることを確認
  def active_for_authentication?
    super && !deleted_at
  end

  # 削除したユーザーにカスタムメッセージを追加します
  def inactive_message
    !deleted_at ? super : :deleted_account
  end


  def remember_me
    true
  end

  def password_presence?
    password.present? && password_confirmation.present?
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def user_create_passport_rate(users)
    sum = users.where.not(select_passport: nil).count
    rate = sum.to_f/users.count.to_f
    return rate*100
  end

  mount_uploader :profile_image, ProfileImageUploader

  private
    def set_default
      self.email_magazine ||= true
      self.release ||= true
    end

    def email_soft_deleted_checked
    end
end
