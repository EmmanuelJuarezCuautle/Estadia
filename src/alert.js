// alert.js
export function showAlert() {
    Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'El área ya ha sido tomada.',
        toast: true,
        position: 'top-end',
        background: '#fef6f6',
        color: '#d9534f',
        iconColor: '#d9534f',
        showConfirmButton: false,
        timer: 3000,
    });
}
