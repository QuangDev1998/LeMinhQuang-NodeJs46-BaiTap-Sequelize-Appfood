export const responeSuccess = (metaData = null, message = "ok", code = 200) => {
  if (typeof code !== "number") code = 200;
  return {
    status: "Thành công",
    code,
    message,
    metaData,
    doc: "api.domain.com/doc",
  };
};

export const responeError = (
  message = `Internal Server Error`,
  code = 500,
  stack = null
) => {
  if (typeof code !== "number") code = 500;
  return {
    status: "Lỗi",
    code,
    message,
    stack,
  };
};
