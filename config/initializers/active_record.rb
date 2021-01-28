ActiveSupport.on_load(:active_record) do
	ActiveRecord::Base.include SignedId
	self.signed_id_verifier_secret ||= -> { Rails.application.key_generator.generate_key("active_record/signed_id") }
end