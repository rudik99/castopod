<?php

/**
 * @copyright  2024 Ad Aures
 * @license    https://www.gnu.org/licenses/agpl-3.0.en.html AGPL3
 * @link       https://castopod.org/
 */

namespace Modules\Media\CastopodSubtitles;

use Done\Subtitles\Code\Converters\ConverterContract;
use Done\Subtitles\Code\Converters\SrtConverter;
use Done\Subtitles\Code\Converters\VttConverter;
use Done\Subtitles\Subtitles;
use Exception;

class CastopodSubtitles extends Subtitles
{
    /**
     * @var array<array{extension:string,format:string,name:string,class:class-string<ConverterContract>}>
     */
    public static $formats = [
        [
            'extension' => 'vtt',
            'format'    => 'vtt',
            'name'      => 'WebVTT',
            'class'     => VttConverter::class,
        ],
        [
            'extension' => 'srt',
            'format'    => 'srt',
            'name'      => 'SubRip',
            'class'     => SrtConverter::class,
        ],
        [
            'extension' => 'json',
            'format'    => 'json',
            'name'      => 'JSON',
            'class'     => JSONConverter::class,
        ],
    ];

    /**
     * @param string $format
     * @param array<mixed> $options
     * @return string
     */
    public function content($format, $options = [])
    {
        /** @var ConverterContract $converter */
        $converter = $this->getConverterByFormat($format);

        return $converter->internalFormatToFileContent($this->internal_format, $options);
    }

    /**
     * @param string $format
     * @return ConverterContract
     */
    private function getConverterByFormat($format)
    {
        foreach (self::$formats as $row) {
            if ($row['format'] === $format) {
                $full_class_name = $row['class'];
                /** @var ConverterContract $converter */
                $converter = new $full_class_name();
                return $converter;
            }
        }

        throw new Exception("Can't find suitable converter, for format: {$format}");
    }
}
