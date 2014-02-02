module Overcommit::Hook::PreCommit
  # Ensures that a commit author has a name with at least first and last names.
  class AuthorName < Base
    def run
      result = command('git config --get user.name')
      name = result.stdout.chomp

      unless name.split(' ').count >= 2
        return :bad, 'Author must have at least first and last name; ' <<
                     "was: '#{name}'.\n Set your name with " <<
                     "`git config --global user.name 'Your Name'`"
      end

      :good
    end
  end
end