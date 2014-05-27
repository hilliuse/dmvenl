module ApplicationHelper

  def verification_code
    chars = []
    ('0'..'9').each{ |ch| chars.push ch }
    ('a'..'z').each do |ch|
      chars.push ch
      chars.push ch.upcase
    end
    code = (0..9).map { chars[rand(chars.length)]}.join
  end

end
