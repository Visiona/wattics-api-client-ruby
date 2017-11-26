# class JsonUtils
#
#   # dateTime = DateTime.new(2001,2,3,4,5,6,Rational(0,24)).strftime("yyyy-MM-dd'T'HH:mm:ss.SSS'+00:00'")
#
#   def serialize(object)
#     gson = Gson::Encoder.new.encode(object)
#     JSON.parse(gson)
#   end
#
# end

#
# package com.wattics.internal;
#
# import com.google.gson.Gson;
# import com.google.gson.GsonBuilder;
#
# import java.time.LocalDateTime;
#
# public class JsonUtils {
#     private static final Gson GSON;
#
#     static {
#         GSON = new GsonBuilder()
#                 .registerTypeAdapter(LocalDateTime.class, new WatticsDateTimeAdapter())
#                 .create();
#     }
#
#     public static String serialize(Object object) {
#         return GSON.toJson(object);
#     }
# }
