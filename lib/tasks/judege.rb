class HelloBatch
  def self.execute
    Quiz.create
  end
end

HelloBatch.execute