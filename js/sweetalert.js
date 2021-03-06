const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',    
    showConfirmButton: false,
    timer: 1600,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })