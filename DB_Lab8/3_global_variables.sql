print '========================================================================='
print '                                бепяхъ'
print @@VERSION
print '========================================================================='

print 'Server Name: ' + cast(@@SERVERNAME as char)
print 'Process ID: ' + cast(@@SPID as char)
print 'Rows count: ' + CAST(@@ROWCOUNT as char)
print 'Last error ID: ' + cast(@@ERROR as char)
print 'Transaction Level: ' + cast(@@TRANCOUNT as char)
print 'Fetch status: ' + cast(@@FETCH_STATUS as char)
print 'Current operation Level: ' + cast(@@NESTLEVEL as char)
print '========================================================================='
