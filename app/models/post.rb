class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :non_clickbait

    def non_clickbait
        count = 0
        if title
        clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
        clickbait.each do |click|
            if !self.title.include?(click)
                count += 1
            end
        end
        if count == 4 
            errors.add(:title, "needs to be clickbait")
        end
    end
    end
end
