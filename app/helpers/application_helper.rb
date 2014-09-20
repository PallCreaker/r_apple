module ApplicationHelper
  def set_gender_for_convert(gender)
    gender == 0 ? "男" : "女"
  end

  def set_univ_for_convert(univ)
    case univ
      when 'waseda'
        'ワセダダイガク'
      when 'doshisha'
        '同志社大学'
      when 'keio'
        '慶應大学'
    end
  end
end
