require 'pry'

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-fiction)}
    validate :clickbait

    def clickbait
        baity = ["Won't", "Believe" "Secret", "Top", "Guess"]
        if self.title
            titley = self.title.split(" ")
            test = []
            titley.each do |word|
                if baity.include?(word)
                    test << word
                end
            end
            if test.length == 0
                errors.add(:title, "must be clickbait-y")
            end
        end
    end

end
