class Test < Volt::Model
	before_save :test_method unless RUBY_PLATFORM == "opal"

	def test_method
		print "entering callback: #{self.to_json}, saved_state: #{self.saved_state}\n"
		self._attribute = "test2"
		print "exiting callback: #{self.to_json}, saved_state: #{self.saved_state}\n"
	end
end