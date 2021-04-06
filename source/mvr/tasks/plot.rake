# frozen_string_literal: true

namespace :mvr do
  desc 'Plot all gnuplot scripts'
  task :plot do
    Dir['mvr/gnuplot/*.gnu'].each do |script|
      puts "gnuplot #{script}"
      `gnuplot #{script}`
    end
  end
end
