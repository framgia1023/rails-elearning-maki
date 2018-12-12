module Admin::WordsHelper

    def correct_answer
         Choice.where(correct: true)     
    end

end