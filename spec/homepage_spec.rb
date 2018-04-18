describe "homepage", type: :feature, js: true do
  it "is accessible" do
    visit '/'
    expect(find('h1.post-title-main').text).to match /A Guide For The Samvera Community/
  end
end
