10.times do |i|
  Blog.create(slug: "test-test#{i}", title: "test #{i}", body: "我々は猫である" * i)
end