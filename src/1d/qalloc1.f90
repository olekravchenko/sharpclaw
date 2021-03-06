subroutine qalloc(mbc,nx,meqn,maux,r1,r2,ti)

    use Global
    implicit none
    integer, intent(in) :: mbc,nx,meqn,maux,ti
    integer :: stat
    type(rkreg) :: r1,r2

    write(6,*) '  Allocating memory for q and auxillary arrays'
    allocate(q(1-mbc:nx+mbc, meqn), STAT=stat)
    if (stat > 0) then
        write(6,*) 'ERROR: Allocation of q failed with status: ', stat
        stop
    endif
    allocate(qold(1-mbc:nx+mbc, meqn), STAT=stat)
    if (stat > 0) then
        write(6,*) 'ERROR: Allocation of q failed with status: ', stat
        stop
    endif
    allocate(aux(1-mbc:nx+mbc, maux), STAT=stat)
    if (stat > 0) then
        write(6,*) 'ERROR: Allocation of aux failed with status: ',stat
        stop
    endif

    allocate( r1%qrk(1-mbc:nx+mbc, meqn) )
    if (ti==4) then
        allocate( r2%qrk(1-mbc:nx+mbc, meqn) )
    endif

end subroutine qalloc
