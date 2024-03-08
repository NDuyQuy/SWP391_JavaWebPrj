/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.commons.fileupload2.core;

/**
 * Receives progress information. May be used to display a progress bar.
 */
@FunctionalInterface
public interface ProgressListener {

    /**
     * Nop implementation.
     */
    ProgressListener NOP = (bytesRead, contentLength, items) -> {
        // nop
    };

    /**
     * Updates the listeners status information.
     *
     * @param bytesRead     The total number of bytes, which have been read so far.
     * @param contentLength The total number of bytes, which are being read. May be -1, if this number is unknown.
     * @param items         The number of the field, which is currently being read. (0 = no item so far, 1 = first item is being read, ...)
     */
    void update(long bytesRead, long contentLength, int items);

}
