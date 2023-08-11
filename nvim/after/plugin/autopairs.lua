local npairs = require 'nvim-autopairs'
local Rule   = require 'nvim-autopairs.rule'

npairs.setup({
    check_ts = true
})

local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
            }, pair)
        end)
}
for _, bracket in pairs(brackets) do
    npairs.add_rules {
        Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(function() return false end)
            :with_move(function(opts)
                return opts.prev_char:match('.%' .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2])
    }
end

local angle_braces = { '<', '>' }



npairs.add_rules {
    Rule(angle_braces[1], angle_braces[2])
        :with_move(function() return true end)
}

for _, punct in pairs { ",", ";", ">" } do
    require "nvim-autopairs".add_rules {
        require "nvim-autopairs.rule" ("", punct)
            :with_move(function(opts) return opts.char == punct end)
            :with_pair(function() return false end)
            :with_del(function() return false end)
            :with_cr(function() return false end)
            :use_key(punct)
    }
end
