pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

#[no_mangle]
pub unsafe extern "C" fn greet(name: *const libc::c_char) {
    if let Some(cstr) = name.as_ref() {
        let name_str = std::ffi::CStr::from_ptr(cstr).to_string_lossy();
        println!("Hello, {}! (from Rust)", name_str);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
