-- Build configuration for scripture

module = "scripture"
checkformat = "latex"
stdengine    = "pdftex"
checkengines = {"pdftex"}
checkconfigs = {"build", "config-unicode"}
typesetexe = "lualatex"

tagfiles = {"*.dtx", "*.ins", "README.md"}

function update_tag(file, content, tagname, tagdate)
  -- Update version in LaTeX package/class
  content = content:gsub(
    "(\\Provides%w+%s*%b{}%s*%[)%d%d%d%d%-%d%d%-%d%d%s+v[%d%.%a]+",
    "%1" .. tagdate .. " v" .. tagname
  )

  -- Update version in Expl package/class
  content = content:gsub(
    "(\\ProvidesExpl%w+%s*%b{}%s*)(%b{})(%s*)(%b{})",
    function(prefix, _date, ws, _ver)
      return prefix
        .. "{" .. tagdate .. "}"
        .. ws
        .. "{" .. tagname .. "}"
    end
  )

  -- Update version in documentation
  content = content:gsub(
    "(\\date%{)%d%d%d%d[%-%/]%d%d[%-%/]%d%d%s+v[%d%.%a]+(%})",
    "%1" .. tagdate .. " v" .. tagname .. "%2"
  )

  -- Update end year in copyright range: Copyright (c) YYYY-YYYY
  content = content:gsub(
    "(Copyright %([Cc]%) %d%d%d%d%-)(%d%d%d%d)",
    function(prefix, endyear)
      local tagyear = tagdate:sub(1, 4)
      if tagyear > endyear then
        return prefix .. tagyear
      else
        return prefix .. endyear
      end
    end
  )

  -- Update single copyright year: if tagdate year is greater, convert to range
  content = content:gsub(
    "(Copyright %([Cc]%) )(%d%d%d%d)([^%-%d])",
    function(prefix, year, after)
      local tagyear = tagdate:sub(1, 4)
      if tagyear > year then
        return prefix .. year .. "-" .. tagyear .. after
      else
        return prefix .. year .. after
      end
    end
  )

  return content
end
