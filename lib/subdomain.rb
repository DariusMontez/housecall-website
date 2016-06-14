class HCNCentralSubdomain
	def self.matches?(request)
    case request.subdomain
    when 'hcncentral'
      true
    else
      false
    end
  end
end
