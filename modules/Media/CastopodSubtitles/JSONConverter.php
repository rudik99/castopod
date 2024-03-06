<?php

/**
 * @copyright  2024 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace Modules\Media\CastopodSubtitles;

use Done\Subtitles\Code\Converters\ConverterContract;

class JSONConverter implements ConverterContract
{
    /**
     * @param string $file_content
     * @return bool
     */
    public function canParseFileContent($file_content)
    {
        json_decode($file_content);
        return json_last_error() === JSON_ERROR_NONE;
    }

    /**
     * @param string $file_content
     * @param string $original_file_content
     * @return array<array{start:int,end:int,lines:array<string>}>
     */
    public function fileContentToInternalFormat($file_content, $original_file_content)
    {
        /** @var array<array{startTime:int,endTime:int,text:string}> $jsonTranscriptArray */
        $jsonTranscriptArray = json_decode($file_content, true);

        $internalFormat = [];
        foreach ($jsonTranscriptArray as $segment) {
            $internalFormat[] = [
                'start' => $segment['startTime'],
                'end'   => $segment['endTime'],
                'lines' => explode(PHP_EOL, $segment['text']),
            ];
        }

        return $internalFormat;
    }

    /**
     * @param array<array{start:int,end:int,lines:array<string>}> $internal_format
     * @param array<mixed> $output_settings
     */
    public function internalFormatToFileContent(array $internal_format, array $output_settings): string
    {
        /** @var array<array{number:int,startTime:int,endTime:int,text:string}> $jsonTranscriptArray */
        $jsonTranscriptArray = [];

        foreach ($internal_format as $key => $value) {
            $jsonTranscriptArray[] = [
                'number'    => $key,
                'startTime' => $value['start'],
                'endTime'   => $value['end'],
                'text'      => implode(PHP_EOL, $value['lines']),
            ];
        }

        return (string) json_encode($jsonTranscriptArray);
    }
}
