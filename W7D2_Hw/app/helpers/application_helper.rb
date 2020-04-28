module ApplicationHelper
    def auth_token(token)
        "<input class =\"auth_token\">#{h(token)}<input>".html_safe
    end
end
