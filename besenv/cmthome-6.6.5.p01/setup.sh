# echo "setup cmt_standalone v0 in /afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/besenv/cmthome-6.6.5.p01"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/ihep.ac.cn/bes3/offline/ExternalLib/SLC6/contrib/CMT/v1r25; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtcmt_standalonetempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtcmt_standalonetempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=cmt_standalone -version=v0 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/besenv/cmthome-6.6.5.p01  -no_cleanup $* >${cmtcmt_standalonetempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt setup -sh -pack=cmt_standalone -version=v0 -path=/afs/ihep.ac.cn/users/s/suym/bes/kpi/v0.2/besenv/cmthome-6.6.5.p01  -no_cleanup $* >${cmtcmt_standalonetempfile}"
  cmtsetupstatus=2
  /bin/rm -f ${cmtcmt_standalonetempfile}
  unset cmtcmt_standalonetempfile
  return $cmtsetupstatus
fi
cmtsetupstatus=0
. ${cmtcmt_standalonetempfile}
if test $? != 0 ; then
  cmtsetupstatus=2
fi
/bin/rm -f ${cmtcmt_standalonetempfile}
unset cmtcmt_standalonetempfile
return $cmtsetupstatus

