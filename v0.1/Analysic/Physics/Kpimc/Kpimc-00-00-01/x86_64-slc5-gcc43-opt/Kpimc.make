#-- start of make_header -----------------

#====================================
#  Library Kpimc
#
#   Generated Thu Aug 25 18:36:59 2016  by suym
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_Kpimc_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_Kpimc_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_Kpimc

Kpimc_tag = $(tag)

ifdef READONLY
cmt_local_tagfile_Kpimc = /tmp/CMT_$(Kpimc_tag)_Kpimc.make$(cmt_lock_pid)
else
#cmt_local_tagfile_Kpimc = $(Kpimc_tag)_Kpimc.make
cmt_local_tagfile_Kpimc = $(bin)$(Kpimc_tag)_Kpimc.make
endif

else

tags      = $(tag),$(CMTEXTRATAGS)

Kpimc_tag = $(tag)

ifdef READONLY
cmt_local_tagfile_Kpimc = /tmp/CMT_$(Kpimc_tag).make$(cmt_lock_pid)
else
#cmt_local_tagfile_Kpimc = $(Kpimc_tag).make
cmt_local_tagfile_Kpimc = $(bin)$(Kpimc_tag).make
endif

endif

-include $(cmt_local_tagfile_Kpimc)

ifdef cmt_Kpimc_has_target_tag

ifdef READONLY
cmt_final_setup_Kpimc = /tmp/CMT_Kpimc_Kpimcsetup.make
cmt_local_Kpimc_makefile = /tmp/CMT_Kpimc$(cmt_lock_pid).make
else
cmt_final_setup_Kpimc = $(bin)Kpimc_Kpimcsetup.make
cmt_local_Kpimc_makefile = $(bin)Kpimc.make
endif

else

ifdef READONLY
cmt_final_setup_Kpimc = /tmp/CMT_Kpimcsetup.make
cmt_local_Kpimc_makefile = /tmp/CMT_Kpimc$(cmt_lock_pid).make
else
cmt_final_setup_Kpimc = $(bin)Kpimcsetup.make
cmt_local_Kpimc_makefile = $(bin)Kpimc.make
endif

endif

ifdef READONLY
cmt_final_setup = /tmp/CMT_Kpimcsetup.make
else
cmt_final_setup = $(bin)Kpimcsetup.make
endif

Kpimc ::


ifdef READONLY
Kpimc ::
	@echo tags=$(tags)
	@echo cmt_local_tagfile=$(cmt_local_tagfile)
endif


dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'Kpimc'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = Kpimc/
Kpimc::
	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

#-- end of make_header ------------------

#-- start of libary_header ---------------

Kpimclibname   = $(bin)$(library_prefix)Kpimc$(library_suffix)
Kpimclib       = $(Kpimclibname).a
Kpimcstamp     = $(bin)Kpimc.stamp
Kpimcshstamp   = $(bin)Kpimc.shstamp

Kpimc :: dirs  KpimcLIB
	$(echo) "Kpimc ok"

#-- end of libary_header ----------------

KpimcLIB :: $(Kpimclib) $(Kpimcshstamp)
	@/bin/echo "------> Kpimc : library ok"

$(Kpimclib) :: $(bin)Kpimc.o
	$(lib_echo) library
	$(lib_silent) cd $(bin); \
	  $(ar) $(Kpimclib) $?
	$(lib_silent) $(ranlib) $(Kpimclib)
	$(lib_silent) cat /dev/null >$(Kpimcstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

$(Kpimclibname).$(shlibsuffix) :: $(Kpimclib) $(Kpimcstamps)
	$(lib_silent) cd $(bin); QUIET=$(QUIET); $(make_shlib) "$(tags)" Kpimc $(Kpimc_shlibflags)

$(Kpimcshstamp) :: $(Kpimclibname).$(shlibsuffix)
	@if test -f $(Kpimclibname).$(shlibsuffix) ; then cat /dev/null >$(Kpimcshstamp) ; fi

Kpimcclean ::
	$(cleanup_echo) objects
	$(cleanup_silent) cd $(bin); /bin/rm -f $(bin)Kpimc.o

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

ifeq ($(INSTALLAREA),)
installarea = $(CMTINSTALLAREA)
else
ifeq ($(findstring `,$(INSTALLAREA)),`)
installarea = $(shell $(subst `,, $(INSTALLAREA)))
else
installarea = $(INSTALLAREA)
endif
endif

install_dir = ${installarea}/${CMTCONFIG}/lib
Kpimcinstallname = $(library_prefix)Kpimc$(library_suffix).$(shlibsuffix)

Kpimc :: Kpimcinstall

install :: Kpimcinstall

Kpimcinstall :: $(install_dir)/$(Kpimcinstallname)
	@if test ! "${installarea}" = ""; then\
	  echo "installation done"; \
	fi

$(install_dir)/$(Kpimcinstallname) :: $(bin)$(Kpimcinstallname)
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test ! -d "$(install_dir)"; then \
	      mkdir -p $(install_dir); \
	    fi ; \
	    if test -d "$(install_dir)"; then \
	      echo "Installing library $(Kpimcinstallname) into $(install_dir)"; \
	      if test -e $(install_dir)/$(Kpimcinstallname); then \
	        $(cmt_uninstall_area_command) $(install_dir)/$(Kpimcinstallname); \
	        $(cmt_uninstall_area_command) $(install_dir)/$(Kpimcinstallname).cmtref; \
	      fi; \
	      $(cmt_install_area_command) `pwd`/$(Kpimcinstallname) $(install_dir)/$(Kpimcinstallname); \
	      echo `pwd`/$(Kpimcinstallname) >$(install_dir)/$(Kpimcinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot install library $(Kpimcinstallname), no installation directory specified"; \
	  fi; \
	fi

Kpimcclean :: Kpimcuninstall

uninstall :: Kpimcuninstall

Kpimcuninstall ::
	@if test ! "${installarea}" = ""; then \
	  cd $(bin); \
	  if test ! "$(install_dir)" = ""; then \
	    if test -d "$(install_dir)"; then \
	      echo "Removing installed library $(Kpimcinstallname) from $(install_dir)"; \
	      $(cmt_uninstall_area_command) $(install_dir)/$(Kpimcinstallname); \
	      $(cmt_uninstall_area_command) $(install_dir)/$(Kpimcinstallname).cmtref; \
	    fi \
          else \
	    echo "Cannot uninstall library $(Kpimcinstallname), no installation directory specified"; \
	  fi; \
	fi




#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),Kpimcclean)

#$(bin)Kpimc_dependencies.make :: dirs

ifndef QUICK
$(bin)Kpimc_dependencies.make : ../src/Kpimc.cxx $(use_requirements) $(cmt_final_setup_Kpimc)
	$(echo) "(Kpimc.make) Rebuilding $@"; \
	  $(build_dependencies) Kpimc -all_sources -out=$@ ../src/Kpimc.cxx
endif

#$(Kpimc_dependencies)

-include $(bin)Kpimc_dependencies.make

endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

$(bin)Kpimc_dependencies.make : $(Kpimc_cxx_dependencies)

$(bin)$(binobj)Kpimc.o : $(Kpimc_cxx_dependencies)
	$(cpp_echo) $(src)Kpimc.cxx
	$(cpp_silent) $(cppcomp) -o $(@) $(use_pp_cppflags) $(Kpimc_pp_cppflags) $(lib_Kpimc_pp_cppflags) $(Kpimc_pp_cppflags) $(use_cppflags) $(Kpimc_cppflags) $(lib_Kpimc_cppflags) $(Kpimc_cppflags) $(Kpimc_cxx_cppflags)  $(src)Kpimc.cxx

#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: Kpimcclean
	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(Kpimc.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
else
.DEFAULT::
	$(echo) "(Kpimc.make) PEDANTIC: $@: No rule for such target" >&2
	if test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_Kpimc)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(Kpimc.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr index $@ '/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(Kpimc.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(Kpimc.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

Kpimcclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(binobj)$(library_prefix)Kpimc$(library_suffix).a $(binobj)$(library_prefix)Kpimc$(library_suffix).s? $(binobj)Kpimc.stamp $(binobj)Kpimc.shstamp
#-- end of cleanup_library ---------------

