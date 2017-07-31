class Alert
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def self.alert_type(type)
    if type == "notice"
      "alert alert-success"
    else
      "alert alert-danger"
    end
  end
end
