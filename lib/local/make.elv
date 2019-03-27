use github.com/zzamboni/elvish-completions/comp

special_target = '^(.SUFFIXES|.PHONY|.DEFAULT|.PRECIOUS|.INTERMEDIATE|.SECONDARY|.SECONDEXPANSION|.DELETE_ON_ERROR|.IGNORE|.LOW_RESOLUTION_TIME|.SILENT|.EXPORT_ALL_VARIABLES|.NOTPARALLEL|.ONESHELL|.POSIX|.NOEXPORT|.MAKE)'

edit:completion:arg-completer[make] = (comp:sequence [[stem]{
      result = ?(grep -s -oE "^"$stem"[^.%_][.a-zA-Z0-9_-]+:([^=]|$)" Makefile | grep -vE $special_target | sed 's/[^a-zA-Z0-9_-]*$//')
}])
