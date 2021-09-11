class TextAnalyzer
  def process
    file = File.open("sample_text.txt")
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text|
  paragraphs = text.split("\n\n").size
  puts "#{paragraphs} paragraphs"
end 

analyzer.process do |text|
  lines = text.split("\n").size
  puts "#{lines} lines"
end 

analyzer.process do |text|
  words = text.split.size
  puts "#{words} words"
end