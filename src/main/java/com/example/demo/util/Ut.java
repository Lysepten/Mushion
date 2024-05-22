package com.example.demo.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

public class Ut {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    // 문자열 포맷팅을 위한 f 메서드
    public static String f(String format, Object... args) {
        return String.format(format, args);
    }

    // 문자열이 null 또는 빈 문자열인지 확인하는 메서드
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().length() == 0;
    }

    // 객체가 비어있는지 확인하는 메서드
    public static <T> T ifEmpty(T data, T defaultValue) {
        if (isEmpty(data)) {
            return defaultValue;
        }
        return data;
    }

    // 객체가 비어있는지 확인하는 메서드
    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        }

        if (obj instanceof Integer) {
            return (int) obj == 0;
        }

        if (obj instanceof String) {
            return ((String) obj).trim().length() == 0;
        }

        if (obj instanceof Map) {
            return ((Map<?, ?>) obj).isEmpty();
        }

        if (obj.getClass().isArray()) {
            return Array.getLength(obj) == 0;
        }

        return false;
    }

    // JavaScript로 history.back() 및 알림을 생성하는 메서드
    public static String jsHistoryBack(String resultCode, String msg) {
        if (resultCode == null) {
            resultCode = "";
        }
        if (msg == null) {
            msg = "";
        }
        String resultMsg = resultCode + " / " + msg;

        return Ut.f("""
                <script>
                    const resultMsg = '%s'.trim();
                    if(resultMsg.length > 0){
                        alert(resultMsg);
                    }
                    history.back();
                </script>
                """, resultMsg);
    }

    // JavaScript로 location.replace() 및 알림을 생성하는 메서드
    public static String jsReplace(String resultCode, String msg, String replaceUri) {
        if (resultCode == null) {
            resultCode = "";
        }
        if (msg == null) {
            msg = "";
        }
        if (replaceUri == null) {
            msg = "/";
        }

        String resultMsg = resultCode + " / " + msg;

        return Ut.f("""
                <script>
                    const resultMsg = '%s'.trim();
                    if(resultMsg.length > 0){
                        alert(resultMsg);
                    }
                    location.replace('%s');
                </script>
                """, resultMsg, replaceUri);
    }

    // 객체를 JSON 문자열로 변환하는 메서드
    public static String toJsonString(Object obj) {
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            // 실제 프로덕션 환경에서는 로깅 프레임워크를 사용하거나 적절한 예외 처리를 해야 합니다.
            return null;
        }
    }

    // 현재 URI를 인코딩하는 메서드
    public static String getEncodedCurrentUri(String currentUri) {
        try {
            return URLEncoder.encode(currentUri, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return currentUri;
        }
    }

    // 시간을 더한 날짜 문자열을 반환하는 메서드
    public static String getDateStrLater(long seconds) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = format.format(System.currentTimeMillis() + seconds * 1000);
        return dateStr;
    }

    // 객체를 JSON 문자열로 변환하는 메서드
    public static String toJsonStr(Object obj) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    // 맵을 JSON 문자열로 변환하는 메서드
    public static String toJsonStr(Map<String, Object> param) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(param);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    // 맵에서 특정 속성 값을 가져오는 메서드
    public static String getStrAttr(Map map, String attrName, String defaultValue) {
        if (map.containsKey(attrName)) {
            return (String) map.get(attrName);
        }
        return defaultValue;
    }

    // 파일 이름에서 파일 확장자 유형 코드를 가져오는 메서드
    public static String getFileExtTypeCodeFromFileName(String fileName) {
        String ext = getFileExtFromFileName(fileName).toLowerCase();
        switch (ext) {
            case "jpeg":
            case "jpg":
            case "gif":
            case "png":
                return "img";
            case "mp4":
            case "avi":
            case "mov":
                return "video";
            case "mp3":
                return "audio";
        }
        return "etc";
    }

    // 파일 이름에서 파일 확장자 유형2 코드를 가져오는 메서드
    public static String getFileExtType2CodeFromFileName(String fileName) {
        String ext = getFileExtFromFileName(fileName).toLowerCase();
        switch (ext) {
            case "jpeg":
            case "jpg":
                return "jpg";
            case "gif":
                return ext;
            case "png":
                return ext;
            case "mp4":
                return ext;
            case "mov":
                return ext;
            case "avi":
                return ext;
            case "mp3":
                return ext;
        }
        return "etc";
    }

    // 파일 이름에서 파일 확장자를 가져오는 메서드
    public static String getFileExtFromFileName(String fileName) {
        int pos = fileName.lastIndexOf(".");
        String ext = fileName.substring(pos + 1);
        return ext;
    }

    // 현재 년월을 문자열로 반환하는 메서드
    public static String getNowYearMonthDateStr() {
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy_MM");
        String dateStr = format1.format(System.currentTimeMillis());
        return dateStr;
    }

    // 문자열을 구분자로 분할하여 정수 리스트를 반환하는 메서드
    public static List<Integer> getListDividedBy(String str, String divideBy) {
        return Arrays.asList(str.split(divideBy)).stream().map(s -> Integer.parseInt(s.trim()))
                .collect(Collectors.toList());
    }

    // 파일을 삭제하는 메서드
    public static boolean deleteFile(String filePath) {
        java.io.File ioFile = new java.io.File(filePath);
        if (ioFile.exists()) {
            return ioFile.delete();
        }
        return true;
    }

    // 맵을 생성하는 메서드
    public static Map<String, Object> mapOf(Object... args) {
        if (args.length % 2 != 0) {
            throw new IllegalArgumentException("인자를 짝수개 입력해주세요.");
        }
        int size = args.length / 2;
        Map<String, Object> map = new LinkedHashMap<>();
        for (int i = 0; i < size; i++) {
            int keyIndex = i * 2;
            int valueIndex = keyIndex + 1;
            String key;
            Object value;
            try {
                key = (String) args[keyIndex];
            } catch (ClassCastException e) {
                throw new IllegalArgumentException("키는 String으로 입력해야 합니다. " + e.getMessage());
            }
            value = args[valueIndex];
            map.put(key, value);
        }
        return map;
    }

    // 객체를 정수로 변환하는 메서드
    public static int getAsInt(Object object, int defaultValue) {
        if (object instanceof BigInteger) {
            return ((BigInteger) object).intValue();
        } else if (object instanceof Double) {
            return (int) Math.floor((double) object);
        } else if (object instanceof Float) {
            return (int) Math.floor((float) object);
        } else if (object instanceof Long) {
            return (int) object;
        } else if (object instanceof Integer) {
            return (int) object;
        } else if (object instanceof String) {
            return Integer.parseInt((String) object);
        }
        return defaultValue;
    }

    // 객체가 null인 경우 기본값을 반환하는 메서드
    public static <T> T ifNull(T data, T defaultValue) {
        return data != null ? data : defaultValue;
    }

    // HttpServletRequest의 속성 값을 가져오는 메서드
    public static <T> T reqAttr(HttpServletRequest req, String attrName, T defaultValue) {
        return (T) ifNull(req.getAttribute(attrName), defaultValue);
    }

    // 문자열을 SHA-256 해싱하는 메서드
    public static String sha256(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 임시 비밀번호를 생성하는 메서드
    public static String getTempPassword(int length) {
        int index = 0;
        char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f',
                'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            index = (int) (charArr.length * Math.random());
            sb.append(charArr[index]);
        }
        return sb.toString();
    }
}
